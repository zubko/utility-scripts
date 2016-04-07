# Performing very custom task, but some parts can be reused if needed:
# Add key combination:
#  { "keys": ["control+m"], "command": "super_plugin_clean_line" }

import sublime, sublime_plugin, re

class SuperPluginCleanLineCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    lineContents = self.currentLineContent()
    fixedContents = self.fixedLine(lineContents)
    self.replaceCurrentLine(edit, fixedContents)
    self.moveCursorToNextLine()

  def currentLine(self):
    view = self.view
    region = self.view.sel()[0] 
    return self.view.line(region)

  def currentLineContent(self):
    line = self.currentLine()
    return self.view.substr(line) 

  def replaceCurrentLine(self, edit, newContent):
    self.view.replace(edit, self.currentLine(), newContent)

  def fixedLine(self, line):
    line = re.sub(r"^\d+\s+", "", line)
    line = re.sub(r"^([a-zA-Z\s,\-&\.\'\(\):/]+)\s+\d.*$", r"\1", line)
    return line

  def moveCursorToNextLine(self):
    (row,col) = self.view.rowcol(self.view.sel()[0].begin())
    target = self.view.text_point(row + 1, col)
    self.view.sel().clear()
    self.view.sel().add(sublime.Region(target))
    self.view.show(target)

