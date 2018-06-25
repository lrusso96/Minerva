module StaticPagesHelper
  def shorten_string(s, l)
    s[0..l] + '...'
  end

  def shorten_title(p)
    shorten_string p.title, 40
  end

  def shorten_abstract(p)
    shorten_string p.description, 80
  end
end
