module Puma
  module RuntimeEnv
    module K8s
      def get_env
        env = {}

        secrets_mount_path = ENV["SECRETS_MOUNT_PATH"]

        if File.directory? secrets_mount_path
          Dir.foreach(secrets_mount_path) do |filename|
            file_path = "#{secrets_mount_path}/#{filename}"

            begin
              env[filename] = File.read(file_path)
            rescue StandardError => e
              puts "ERROR: Failed to read secrets file #{file_path}"
              puts e
            end
          end
        end

        env
      end
    end
  end
end
