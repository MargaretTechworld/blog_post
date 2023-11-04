module ApplicationHelper
    def truncate(text)
        text.length > 200 ? "#{text[0, 200]}..." : text
    end
end
