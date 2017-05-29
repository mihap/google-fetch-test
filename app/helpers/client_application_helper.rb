module ClientApplicationHelper
  def client_application_javascript_tag(bundle)
    src =
      if Rails.configuration.client_application[:use_manifest]
        manifest = Rails.configuration.client_application[:asset_manifest][bundle]
        bundle = manifest.instance_of?(Array) ? manifest[0] : manifest

        "/assets/#{bundle}"
      else
        "http://localhost:9001/assets/#{bundle}"
      end

    javascript_include_tag src
  end

  def client_application_stylesheet_tag(bundle)
    return unless Rails.configuration.client_application[:use_manifest] && @client_application
    manifest = Rails.configuration.client_application[:asset_manifest][bundle]
    bundle = manifest.instance_of?(Array) ? manifest[0] : manifest

    stylesheet_link_tag "/assets/#{bundle}", media: :all
  end

  def chunks_manifest
    Rails.configuration.client_application[:chunks_manifest]
  end
end
