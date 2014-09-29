class ApiController < ApplicationController	
  respond_to :json

  def all_publications
  	@publications = Publication.all
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
    if ((params['pricefrom'].present?) && (params['priceto'].present?) )
      opFiltersHash[:price] = params[:pricefrom].to_i..params[:priceto].to_i
    elsif (params['priceto'].present?)
      opFiltersHash[:price] = 0..params[:priceto].to_i
    elsif (params['pricefrom'].present?)
      maximumAllowedPrice = 999999999999999999
      opFiltersHash[:price] = params[:pricefrom].to_i..maximumAllowedPrice
    end

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

    @publications = Publication.where(opFiltersHash).order(orderSentence).limit(limitSentence).offset(offsetSentence)
    respond_with @publications.as_json(include: {publication_attachments: {only: :image}})
  end

end
