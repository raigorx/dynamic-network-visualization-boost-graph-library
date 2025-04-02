add_rules("mode.debug", "mode.release")

-- Add external dependencies
add_requires("glfw")
add_requires("boost", {configs = {
    date_time = true,
    program_options = true,
    graph = true,
    thread = true,
    math = true,
    system = true,
    exception = true,
    regex = true
}})

-- Define the target (executable)
target("dynamic-network-visualization")
    set_kind("binary") -- This is an executable
    set_languages("c++17") -- Use C++17 standard

    -- Add source files
    add_files("src/*.cpp") -- Adjust the path to your source files

    -- Link with GLFW
    add_packages("glfw", "boost")
    add_syslinks("opengl32", "glu32") -- Add OpenGL and GLU libraries

    on_run(function ()
        os.execv("./build/windows/x64/debug/dynamic-network-visualization.exe", {
            "--vertices_file_path", "doc/vertices.csv",
            "--edges_file_path", "doc/edges.csv",
            "--start_date", "2010-11-01",
            "--end_date", "2011-04-01"
        })
    end)
