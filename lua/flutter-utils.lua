---@module "flutter-tools"

---@class FlutterUtilsConfig
---@field create_run_configurations fun(user_opts : UserOpts?) : flutter.ProjectConfig[] Main entry point for creating run configurations
---
---@type FlutterUtilsConfig
local M = {}

---@alias targetSpec string | string[]

---@class pre_run_opts
---@field name string
---@field target string
---@field flavor string
---@field device string

---@class UserOpts
---@field flavors (string[])? flavors supported
---@field emulators (table<string, string>)? list of platform and emulators
---@field config_callback (fun(cfg: flutter.ProjectConfig) : flutter.ProjectConfig)? a callback to be run before registering the config
---@field pre_run_callback (fun(opts: pre_run_opts))?
---@field targetSpec targetSpec?
---@field generate_flavor_run_targets boolean? whether targets should be generated based on a flavor naming scheme. E.g. having a flavor "dev" and setting this to true will create a target "lib/main_dev.dart". Defaults to False.
---
---@field dart_define_from_file? string json file to source
---@field dart_define? {[string]: string}
---@field config_callback fun(cfg: flutter.ProjectConfig)? : flutter.ProjectConfig

---@param flavor string
---@return string
local function create_flavor_run_target(flavor)
	return ("lib/main_%s.dart"):format(flavor)
end

-- Builds configs using a single target
---@param emulators string[]
---@param flavors string[]
---@param target string
---@param generate_flavor_run_targets boolean?
---@param dart_define_from_file string?
---@param pre_run_callback (fun(opts: {string: string}))?
---@param config_callback (fun(cfg: flutter.ProjectConfig): flutter.ProjectConfig)?
---@return flutter.ProjectConfig[]
local function handleSingleTarget(
    emulators,
    flavors,
    target,
    generate_flavor_run_targets,
    dart_define_from_file,
    pre_run_callback,
    config_callback
)
	local configs = {}
	for _, flavor in pairs(flavors) do
		for name, device in pairs(emulators) do
			if generate_flavor_run_targets == true then
				target = create_flavor_run_target(flavor)
			end
			---@type flutter.ProjectConfig
			local config = {
				name = ("%s - %s"):format(flavor, name),
				flavor = flavor,
				target = target,
				device = device,
				dart_define_from_file = dart_define_from_file,
				pre_run_callback = pre_run_callback
			}
			if config_callback then
				config = config_callback(config)
			end
			table.insert(configs, config)
		end
	end
	return configs
end


---@param emulators string[]
---@param project_config flutter.ProjectConfig[]
---@return flutter.ProjectConfig[]
function M.create_emulator_configs_only(emulators, project_config)
	local newCfgs = {}
	for _, emulator in ipairs(emulators) do
		for _, proj_cfg in ipairs(project_config) do
			local cfg = proj_cfg
			cfg.device = emulator
			cfg.name = ("%s - %s"):format(emulator, proj_cfg.name)
			table.insert(newCfgs, cfg)
		end
	end
	return newCfgs
end

--- Create run configurations for flutter tools
--- Defaults:
---		- Emulators: android = emulator-5554 || iOS = iPhone 16 Pro
---		- Flavors: dev, qa, prod
---		- Target: lib/main.dart
---@param user_opts UserOpts? any specific run configurations and device overrides
---@return flutter.ProjectConfig[]
function M.create_run_configuration(user_opts)
	local emulators  = user_opts and user_opts.emulators or M.emulators
	local flavors    = user_opts and user_opts.flavors or M.flavors
	local targetSpec = user_opts and user_opts.targetSpec or M.target
	if type(targetSpec) ~= "table" then
		---@cast targetSpec string
		return handleSingleTarget(
			emulators,
			flavors,
			targetSpec,
			user_opts and user_opts.generate_flavor_run_targets,
			user_opts and user_opts.dart_define_from_file,
			user_opts and user_opts.pre_run_callback
		)
	end
	---@cast targetSpec string[]
	local configs = {}
	for _, target in ipairs(targetSpec) do
		local singleTargetConfigs = handleSingleTarget(
			emulators,
			flavors,
			target,
			user_opts and user_opts.generate_flavor_run_targets,
			user_opts and user_opts.dart_define_from_file,
			user_opts and user_opts.pre_run_callback
		)
		table.insert(configs, singleTargetConfigs)
	end
	return configs
end

---@type table<string, string>
M.emulators = {
	android = "emulator-5554",
}

---@type table<string>
M.flavors = { "dev", "qa", "prod" }

---@type targetSpec
M.target = "lib/main.dart"

return M
