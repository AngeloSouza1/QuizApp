# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  storage :file  # Ou :fog se estiver usando armazenamento em nuvem

  # Diretório onde os arquivos serão armazenados
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Extensões permitidas
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # Nome do arquivo para evitar conflitos
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  # Imagem padrão se nenhuma imagem for carregada
  def default_url(*args)
    "logo1.png" # Caminho para a imagem padrão
  end

  protected

  def secure_token
    @secure_token ||= SecureRandom.uuid
  end
end
