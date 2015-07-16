# Encoding: utf-8
# Cloud Foundry Java Buildpack
# Copyright 2013-2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'java_buildpack/component'
require 'java_buildpack/util/qualify_path'

module JavaBuildpack
  module Component

    class EnvironmentVariables < Array
      include JavaBuildpack::Util

      def initialize(droplet_root)
        @droplet_root = droplet_root
      end

      def add_environment_variable(key, value)
        self << "#{key}=#{qualify_value(value)}"
      end

      def as_env_vars
        self
      end

      private

      def qualify_value(value)
        value.respond_to?(:relative_path_from) ? qualify_path(value) : value
      end

    end

  end
end
