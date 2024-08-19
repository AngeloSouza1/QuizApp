# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  # Define o diretório onde os arquivos carregados serão armazenados
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Processa arquivos de imagem para ajustar o tamanho e a qualidade
  process resize_to_fit: [800, 800]
  process :adjust_quality

  # Método para ajustar a qualidade da imagem
  def adjust_quality
    manipulate! do |img|
      img.quality("85")
      img = yield(img) if block_given?
      img
    end
  end

  # Lista branca de extensões de arquivo permitidas
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
