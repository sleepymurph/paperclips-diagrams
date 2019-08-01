define(`TARGET', `shape=oval')
define(`PROJECT', `shape=box')

define(`OPS', `style="", fillcolor=""')
define(`CLIPS', `style=filled, fillcolor=""')
define(`CREAT', `style=filled, fillcolor=mediumpurple')
define(`MONEY', `style=filled, fillcolor=darkolivegreen4')
define(`YOMI', `style=filled, fillcolor=lightblue2')
define(`WIRE', `style=filled, fillcolor=lightsteelblue')
define(`DARK', `style=filled, fillcolor=grey20, fontcolor=grey80')
define(`MEGACREAT', `style=filled, fillcolor=mediumorchid')
define(`QUANTUM', `style=filled, fillcolor=grey40, fontcolor=white')
define(`RESET', `style=filled, fillcolor=orange')

define(`POWERGRID', `style=filled, fillcolor=gold')
define(`DRONE', `style=filled, fillcolor=darkseagreen')
define(`FACTORY', `CLIPS()')

define(`COMBAT', `DARK()')

define(`THEORY_OF_MIND_CLUSTER', `
    subgraph $1_cluster_theory_of_mind {
        // Repeating targets: Theory of Mind and Auto-Tourney
        label="Theory of Mind / Autotourney"
        $1_25k_creat[label="25,000 creat", CREAT(), TARGET()]
        $1_50k_creat[label="50,000 creat", CREAT(), TARGET()]
        $1_all_strats[label="All strats unlocked", YOMI(), TARGET()]
        $1_project119[label="Theory of Mind\n(Double tournament\n cost and reward)", YOMI(), PROJECT()]
        $1_project118[label="AutoTourney ", YOMI(), PROJECT()]

        $1_25k_creat -> $1_50k_creat
        { $1_25k_creat, $1_all_strats } -> $1_project119
        { $1_50k_creat } -> $1_project118
    }
')
