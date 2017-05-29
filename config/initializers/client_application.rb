if Rails.configuration.client_application[:use_manifest]
  [
    ['webpack-asset-manifest.json', :asset_manifest],
    ['webpack-chunk-manifest.json', :chunks_manifest]
  ].each do |filename, name|
    manifest = Rails.root.join('public', 'assets', filename)

    if File.exist?(manifest)
      Rails.configuration.client_application[name] = JSON.parse(
        File.read(manifest)
      ).with_indifferent_access
    end
  end
end
