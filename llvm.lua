-- scaffold geniefile for llvm

llvm_script = path.getabsolute(path.getdirectory(_SCRIPT))
llvm_root = path.join(llvm_script, "llvm")

llvm_includedirs = {
	path.join(llvm_script, "config"),
	llvm_root,
}

llvm_libdirs = {}
llvm_links = {}
llvm_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { llvm_includedirs }
	end,

	_add_defines = function()
		defines { llvm_defines }
	end,

	_add_libdirs = function()
		libdirs { llvm_libdirs }
	end,

	_add_external_links = function()
		links { llvm_links }
	end,

	_add_self_links = function()
		links { "llvm" }
	end,

	_create_projects = function()

project "llvm"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		llvm_includedirs,
	}

	defines {}

	files {
		path.join(llvm_script, "config", "**.h"),
		path.join(llvm_root, "**.h"),
		path.join(llvm_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
