# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
    # incluir suporte rmagick ou imagescience:
    # include CarrierWave::RMagick
    # include CarrierWave::MiniMagick
    # include CarrierWave::ImageScience

    # escolher qual tipo de armazenamento usar para esse uploader
    storage :file
    # storage :fog

    # sobrepor esse diretório quando arquivos postados forem armazenados.
    # isso é um padrão sensível dos uploaders que são para irem montados:
    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # fornece um url padrão caso não tenha tido nenhum arquivo postado:
    # def default_url
    #     "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end

    # processar arquivos conforme são postados:
    # process :scale => [200, 300]
    #
    # def scale(width, height)
    #     # fazer algo
    # end

    # cria diferentes versões dos arquivos postados:
    # version :thumb do
    #     process :scale => [50, 50]
    # end

    # adiciona uma whitelist de extensões que são permitidas de serem postadas.
    # para imagens você precisaria usar algo assim:
    # def extension_white_list
    #     %w(jpg jpeg gif png)
    # end

    # sobrepõe o nome do arquivo dos arquivos postados:
    # isola utilizando model.id ou version_name aqui, veja uploader/store.rb para detalhes.
    # def filename
    #     "algumacoisa.jpg" if original_filename
    # end
end
