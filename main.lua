-- Register menu item and toolbar icon
function initUi()
	app.registerUi({["menu"] = "Save Temp PDF", ["callback"] = "makeTempPdf", ["toolbarId"] = "SAVE_TEMP_PDF", ["iconName"] = "document-page-setup"})
	print("Save Temp PDF plugin loaded!!")
end

function makeTempPdf()
	local xoppName = app.getDocumentStructure()['xoppFilename']
	
	if(xoppName ~= "" and xoppName ~= nil) then
		-- save file before exporting
		app.uiAction({["action"] = "ACTION_SAVE"})
		-- create [filename]_temp.pdf
		local pdfName = string.gsub(xoppName, ".xopp", "_temp.pdf")
		print("exporting " .. xoppName .. " to " .. pdfName)
		app.export({["outputFile"] = pdfName})

	else
		app.msgbox("Cannot create temp pdf, xopp file has not been saved", {[1] = "Ok"})
	end
end
