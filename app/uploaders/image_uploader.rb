# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  # Define o tipo de armazenamento (local ou em nuvem)
  storage :file  # Ou :fog se estiver usando armazenamento em nuvem

  # Diretório onde os arquivos serão armazenados
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Extensões permitidas para upload
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # Nome do arquivo para evitar conflitos de nomes
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  # Imagem padrão se nenhuma imagem for carregada
  def default_url(*args)
    ActionController::Base.helpers.asset_path("logo1.png") # Ajusta para usar o helper de Rails
  end

  protected

  # Gera um token seguro para o nome do arquivo
  def secure_token
    @secure_token ||= SecureRandom.uuid
  end
end
