class ApiController < ApplicationController 
  respond_to :json

  def quotation
    render json: {quotation: Publication::QUOTATION}
  end

  def parseZone(zone)
    return zone.gsub('_',' ').split.map(&:capitalize).join(' ')
  end

  def toCamelCase(aString)
    return zone.gsub('','_').split.map(&:capitalize).join('_')
  end

  def rooms_by_zone
    toReturn = {amb1: 0, amb2: 0, amb3: 0, amb4: 0}
    if(!params['zone'].present?)
      render :json => { :errors => 'El parámetro zone es obligatorio' }
      return
    end
    #El barrio se espera en camel case
    parsedZone = parseZone(params[:zone])
    toReturn["amb1"] = Publication.where("zone=? AND number_of_rooms=?",parsedZone,1).count
    toReturn["amb2"] = Publication.where("zone=? AND number_of_rooms=?",parsedZone,2).count
    toReturn["amb3"] = Publication.where("zone=? AND number_of_rooms=?",parsedZone,3).count
    toReturn["amb4"] = Publication.where("zone=? AND number_of_rooms=?",parsedZone,4).count

    render :json => toReturn.to_json
  end

  #Calcula para la zona pasada por parametro el precio promedio del metro cuadrado en dolares.
  def calculateZoneAveragePrice(zone)
    publicacionesEnPesos = Publication.where("transaction_type=? AND zone=? AND currency=?","Compra",zone,"ARS")
    publicacionesEnDolares = Publication.where("transaction_type=? AND zone=? AND currency=?","Compra",zone,"US")

    #Publicaciones en pesos
    sumaPromediosPesos = 0
    totPubPesos = 0
    publicacionesEnPesos.each do |eachPublicacionEnPesos|
      totPubPesos += 1 
      eachPromedioPesos = eachPublicacionEnPesos.price / eachPublicacionEnPesos.area
      sumaPromediosPesos += eachPromedioPesos
      Rails.logger.debug "Se incluye en el resultado una propiedad en pesos. Nro: #{totPubPesos}, con precio: #{eachPublicacionEnPesos.price}, area: #{eachPublicacionEnPesos.area}"
    end

    #Publicaciones en dólares
    sumaPromediosDolares = 0
    totPubDolares = 0
    publicacionesEnDolares.each do |eachPublicacionEnDolares|
      totPubDolares += 1 
      eachPromedioDolares = eachPublicacionEnDolares.price / eachPublicacionEnDolares.area
      sumaPromediosDolares += eachPromedioDolares
      Rails.logger.debug "Se incluye en el resultado una propiedad en dolares. Nro: #{totPubDolares}, con precio: #{eachPublicacionEnDolares.price}, area: #{eachPublicacionEnDolares.area}"
    end
    
    #Totalización.
    precioDolar = Publication::QUOTATION
    Rails.logger.debug "1 dólar = #{precioDolar} pesos."
    totalMuestras = totPubPesos + totPubDolares
    totalPromedios = sumaPromediosPesos/precioDolar + sumaPromediosDolares
    averageToReturn = 0
    averageToReturn = totalPromedios / totalMuestras if (totalMuestras>0)
    
    Rails.logger.debug "Se devuelve el precio promedio en dolares del barrio #{zone}: #{averageToReturn}"
    return averageToReturn
  end

  def average_by_zone
    toReturn = {promedio: 0}
    if(!params['zone'].present?)
      render :json => { :errors => 'El parámetro zone es obligatorio' }
      return
    end
    #El barrio se esperpza en camel case
    parsedZone = parseZone(params['zone'])
    toReturn["promedio"] = calculateZoneAveragePrice(parsedZone)
    render :json => toReturn.to_json
  end

  def zone_comparison
    if(!params['zone'].present?)
      render :json => { :errors => 'El parámetro zone es obligatorio' }
      return
    end
    supportedZones = Hash[
      "Almagro" => "Villa Crespo,Palermo,Recoleta,Balvanera,Boedo,Caballito",
      "Coghlan" => "Saavedra,Núñez,Belgrano,Villa Urquiza"
    ]
    toReturn = {}
    parsedZone = parseZone(params['zone'])
    aledanios = supportedZones[parsedZone]
    if (aledanios.blank?)
      render :json => { :errors => 'El servicio no se encuentra disponible para la zona indicada' }
      return
    else
      Rails.logger.debug "Las zonas aledañas de #{params['zone']} son: #{aledanios}"
      nearZones = []
      nearZones = aledanios.split(",")
      #Agrega la zona de consulta
      toReturn[parsedZone] = calculateZoneAveragePrice(parsedZone)
      #Y luego las aledañas
      nearZones.each do |eachNearZone|
        toReturn[eachNearZone] = calculateZoneAveragePrice(eachNearZone)
      end
    end
    render :json => toReturn.to_json
  end

  def all_publications
    @publications = Publication.where("retired_at IS ?",nil)
    respond_with @publications.as_json(include: {publication_attachments: {only: :image}})
  end

  def filter_publications
    #Si se quiere debuguear el valor de algo: Rails.logger.debug "Se muestra el objeto: #{objeto}"
    
    #Comprobación de parametros obligatorios (page, count, orderby, ordertype)
    if((!params['page'].present?)||(!params['count'].present?)||(!params['orderby'].present?)||(!params['ordertype'].present?))
      render :json => { :errors => 'Alguno de los parametros obligatiorios no se encuentra en la consulta.' }
      return
    end

    #Se filtra con where, y se define un hash el cual se construye en base a los parámetros presentes.
    opFiltersHash = { }
    
    #Tipo de transacción (ttrans, opcional)
    if (params['ttrans'].present?)
      opFiltersHash[:transaction_type] = 'Compra' if (params[:ttrans] == 'buy')
      opFiltersHash[:transaction_type] = 'Alquiler' if (params[:ttrans] == 'rent')
    end
    
    #Tipo de propiedad (tprop, opcional)
    if (params['tprop'].present?)
      opFiltersHash[:property_type] = 'Casa' if (params[:tprop] == 'house')
      opFiltersHash[:property_type] = 'Departamento' if (params[:tprop] == 'department')
    end
    
    #Barrio (zone, opcional)
    if (params['zone'].present?)
      #Zone se espera que sea una lista delimitada por guiones en snake_case, respetando acentos y eñes.
      #Por el momento no se valida el formato de la misma.
      receivedZones = []
      parsedZones = []
      receivedZones = params[:zone].split("-")
      receivedZones.each do |aZone|
        modelCompatibleZone = aZone.gsub('_',' ').split.map(&:capitalize).join(' ')
        parsedZones.push(modelCompatibleZone)
      end
      opFiltersHash[:zone] = parsedZones
    end
    
    #Rango de precios. (pricefrom y priceto,opcionales). Se modela con BETWEENS.
    dolarPrice = Publication::QUOTATION
    ddePesos = 0
    ddeDolares = 0
    htaPesos = 999999999999999999
    htaDolares = 999999999999999999
    if (params['currency'].present?) 
      if ("#{params[:currency]}" == "usd")
        #Se especificaron dólares en la consulta
        if (params['pricefrom'].present?)
          ddePesos = params[:pricefrom].to_i * dolarPrice
          ddeDolares = params[:pricefrom].to_i
        else
          ddePesos = 0
          ddeDolares = 0
        end
        if (params['priceto'].present?)
          htaPesos = params[:priceto].to_i * dolarPrice
          htaDolares = params[:priceto].to_i
        else
          htaPesos = 999999999999999999
          htaDolares = 999999999999999999
        end
      elsif ("#{params[:currency]}" == "ars")
        #Se especificaron pesos en la consulta
        if (params['pricefrom'].present?)
          ddePesos = params[:pricefrom].to_i
          ddeDolares = params[:pricefrom].to_i / dolarPrice
        else
          ddePesos = 0
          ddeDolares = 0
        end
        if (params['priceto'].present?)
          htaPesos = params[:priceto].to_i
          htaDolares = params[:priceto].to_i / dolarPrice
        else
          htaPesos = 999999999999999999
          htaDolares = 999999999999999999
        end
      end
    else
      #No se especificó moneda en la consulta, por defecto se consideran pesos.
      if ((params['pricefrom'].present?) && (params['priceto'].present?) )
        ddePesos = params[:pricefrom].to_i
        htaPesos = params[:priceto].to_i
        ddeDolares = params[:pricefrom].to_i / dolarPrice
        htaDolares = params[:priceto].to_i / dolarPrice
      elsif (params['priceto'].present?)
        ddePesos = 0
        htaPesos = params[:priceto].to_i
        ddeDolares = 0
        htaDolares = params[:priceto].to_i / dolarPrice
      elsif (params['pricefrom'].present?)
        ddePesos = params[:pricefrom].to_i
        htaPesos = 999999999999999999
        ddeDolares = params[:pricefrom].to_i / dolarPrice
        htaDolares = 999999999999999999
      end
    end
    
    # Rails.logger.debug "Precio dolar: #{dolarPrice}"
    # Rails.logger.debug "Pesos dde: #{ddePesos}"
    # Rails.logger.debug "Pesos hta: #{htaPesos}"
    # Rails.logger.debug "Dolares dde: #{ddeDolares}"
    # Rails.logger.debug "Dolares hta: #{htaDolares}"

    precioQuery = "(currency=? AND price>=? AND price<=?) OR (currency=? AND price>=? AND price<=?)"
    

    #Rango de superficies (supfrom y supto, opcionales). Se modela con BETWEENS.
    if ((params['supfrom'].present?) && (params['supto'].present?) )
      opFiltersHash[:area] = params[:supfrom].to_i..params[:supto].to_i
    elsif (params['supto'].present?)
      opFiltersHash[:area] = 0..params[:supto].to_i
    elsif (params['supfrom'].present?)
      maximumAllowedArea = 999999999999999999
      opFiltersHash[:area] = params[:supfrom].to_i..maximumAllowedArea
    end

    #Cantidad de ambientes (rooms, opcional)
    if (params['rooms'].present?)
      opFiltersHash[:number_of_rooms] = params[:rooms]
    end

    #Sólo se muestran las publicaciones activas
    opFiltersHash[:active] = true
    
    #Fecha de publicación (pubtimefrom y pubtimeto, opcionales)
    #Sólo se enviaran las publicaciones cuya fecha de publicación no superen a la fecha actual.
    minPossibleDate = "1800-01-01".to_date
    minLimitDate = "1800-01-01".to_date #Se inicializa en ese valor y luego se modifica segun corresponda.
    maxLimitDate = Date.current
    if (params['pubtimefrom'].present?)
      if (params['pubtimefrom'].to_date<=maxLimitDate)
        minLimitDate = params['pubtimefrom'].to_date
      else
        #Fecha desde invalida. No se devuelven resultados
        minLimitDate = minPossibleDate
        maxLimitDate = minPossibleDate
      end
    end
    if (params['pubtimeto'].present?)
      if (params['pubtimeto'].to_date<=maxLimitDate)
        maxLimitDate = params['pubtimeto'].to_date
      else
        #Fecha hasta invalida. No se devuelven resultados
        minLimitDate = minPossibleDate
        maxLimitDate = minPossibleDate
      end
    end
    opFiltersHash[:publication_date] = minLimitDate..maxLimitDate

    #Sentencias de ordenamiento (orderby y ordertype, obligatorios). Valores permitidos: {'price', 'pubtime', 'rel'}
    orderSentence = "relevance desc" #Default
    if ("#{params[:orderby]}" == "price")
      orderSentence = "price #{params[:ordertype]} "
    elsif ("#{params[:orderby]}" == "pubtime")
      orderSentence = "publication_date #{params[:ordertype]} "
    elsif ("#{params[:orderby]}" == "rel")
      orderSentence = "relevance #{params[:ordertype]} "
    end
    
    #Paginado (page y count, obligatorios)
    limitSentence = params['count'].to_i
    #Si page=1 y count=5, devuelve 5 registros desde el 1ro
    #Si page=2 y count=5, devuelve los registros desde el 6to
    offsetSentence = (((params['page'].to_i) -1) * (params['count'].to_i))

    # @publications = Publication.where("retired_at IS ?",nil).where(precioQuery).where(opFiltersHash).order(orderSentence).limit(limitSentence).offset(offsetSentence)
    @publications = Publication.where("retired_at IS ?",nil).where(opFiltersHash).where(precioQuery,'US',ddeDolares,htaDolares,'ARS',ddePesos,htaPesos).order(orderSentence).limit(limitSentence).offset(offsetSentence)
    respond_with @publications.as_json( include: 
      {user: {:only => [:email, :phone]}, publication_attachments: {only: :image}})
  end


end
