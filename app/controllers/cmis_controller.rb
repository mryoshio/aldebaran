class CmisController < ApplicationController
  def index
  end
  def search
    cond = []
    if params[:s_name]
      name = params[:s_name]
    end
    if params[:s_ext]
      ext = params[:s_ext]
    end
    if params[:s_fts]
      fts = params[:s_fts]
    end
    if name && name.size > 0
      cond.push (" cmis:name LIKE '" + name + "%'")
    end
    if ext && ext.size > 0
      cond.push (" cmis:name LIKE '%" + ext + "'")
    end
    if fts && fts.size > 0
      cond.push (" CONTAINS('" + fts +"')")
    end
    q = "SELECT * FROM cmis:document"
    if cond.size > 0
      q += " WHERE "
      q += cond.join(" AND ")
    end
    logger.debug("query: " + q)
    @results = $repo.query(q)
    logger.debug("hits: #{@results.size}")
  end
  def explore
    logger.debug(params)
    if params[:parent]
      @children = $repo.object_by_id(params[:parent]).items
    else
      @children = $repo.root_folder.items
     end
    logger.debug("children.size #{@children.size}")
  end
end
