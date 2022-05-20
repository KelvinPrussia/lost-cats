class LostCats
  def initialize
    @adverts = []
  end

  def add(advert)
    @adverts << advert
  end

  def adverts
    return @adverts
  end

  def get(index)
    return @adverts[index]
  end

  def update(index, new_advert)
    @adverts[index] = new_advert
  end

  def remove(index)
    @adverts.delete_at(index)
  end
end
