module UsersHelper 
    def markdown(content)
        tag.articel data: { controller: "markdown-viewer" } do
            content
        end
    end
end