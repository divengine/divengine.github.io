<html>
	<head>
		<title>{$title}</title>
		<style type="text/css">
			body          {background: #656565; font-family: Verdana;}
			div.section   {background: white;	margin-top: 20px; padding: 10px; width: 780px;}
			.section h2   {color: white; font-size: 24px;font-weight: bold; margin-left: -30px;padding-bottom: 5px; padding-left: 30px;padding-top: 5px; background: black; border-left: 10px solid gray;}	
			h1            {color: white;}
			table.data td {padding: 5px;border-bottom: 1px solid gray; border-right: 1px solid gray;}
			table.data th {padding: 5px;color: white; background: black;}
			.code         {padding: 0px; margin: 0px; background: #eeeeee; color: black; font-family: "Courier New"; text-align: left; font-size: 13px;}					
			.code .line   {text-align:right; background: gray; color: white; border-right: 2px solid black; padding-right: 5px;}
			table.index, table.index a, table.index a:visited {color:white;}					
			div.header    {color: white;}
			.template-description{background: #eeeeee; padding: 10px;}
		</style>
	</head>
	<body>
		<label><a href="#header" style="position: fixed; bottom: 5px; right: 5px;color: white;">Index</a></label>
		<table width="750" align="center"><tr><td valign="top">
		<div id = "header" class = "header">
		<h1>{$title}</h1>
		<p>Generated by Div at {/div.now:Y-m-d H:i:s/}</p>
		<h2>Index</h2>
		<table class="index data" width="100%">
			<tr><th></th><th>Name</th><th>Description</th><th>Version</th></tr>
			[$docs]
				<tr><td>{$_order}</td>
				<td><a href="#{$_key}">?$name {$name} $name?</a></td>
				<td>?$description {$description} $description?</td>
				<td>?$version {$version} $version?</td></tr>
			[/$docs]
		</table>
		</div>
		
		{= repl1: [["<",""],[">",""]] =}
		
		[$docs]
			<div class="section">
				<h2 id = "{$_key}">?$icon {$icon} $icon? {$name}</h2>
				<table width="100%">
				<tr><td align="right">Path:</td><td>{$_key} </td></tr>
				?$type    <tr><td align="right" width="150">Type:</td><td><b>{$type}</b></td></tr>$type?
				?$author  <tr><td align="right" width="150">Author:</td><td><b>{html:author}</b></td></tr> $author?
				?$version <tr><td align="right" width="150">Version:</td><td><b>{$version}</b></td></tr> $version?
				?$update  <tr><td align="right" width="150">Last update:</td><td>{$update} </td></tr>$update?
				</table>
				<br/>
				?$description <p class="template-description">{$description}</p>$description?
				?$vars
					<h3>Template's Variables ({$vars})</h3>
					<table class="data">
					<tr><th></th><th></th><th>Type</th><th>Name</th><th>Description</th></tr>
					[$vars]
					
						{?( trim("{'value}") !== "" )?}
						<?
							$value = trim(str_replace(array("\t","\n","\r")," ", $value));	
							while(strpos($value, "  ")) $value = str_replace("  "," ", $value);
							$pars = explode(" ", $value, 4);
						?>
						<tr>
							<td>{$_order}</td>
							[$pars]
							<td>{:repl1}{$value}{:/repl1}</td>
							[/$pars]
						</tr>
						{/?}
					[/$vars]
					</table>
				$vars?
				?$include
					<h3>Include:</h3>
					[$include]
						{$_order}. <a href="#{$value}">{$value}</a><br/>
					[/$include]
				$include?
				?$example
					<h3>Example:</h3>
					<table width = "100%" class="code" cellspacing="0" cellpadding="0">
					[$example]
							<tr>
							<td class="line" width="30">{$_order}</td>
							<td><pre class="code">{html_wysiwyg:afterReplace}{$value}{/html_wysiwyg:afterReplace}</pre></td>
							</tr>
					[/$example]
					</table> 
				$example?
			</div>
		[/$docs]
		</td></tr></table>
	</body>
</html>