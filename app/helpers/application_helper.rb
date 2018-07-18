module ApplicationHelper
    def devise_key_to_bootstrap_class(key)
        bootstrap_keys = {
            "error" => "danger",
            "alert" => "info",
            "success" => "success",
            "notice" => "primary"
        }
        bootstrap_keys[key]
    end
end
