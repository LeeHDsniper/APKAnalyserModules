package com.adobe.creativesdk.aviary.internal.vo;

import java.util.ArrayList;
import java.util.List;

public class EditToolVO
{
  final List<ToolActionVO> toolActions;
  final String toolId;
  final int toolVersion;
  
  public EditToolVO(String paramString, int paramInt)
  {
    toolId = paramString;
    toolVersion = paramInt;
    toolActions = new ArrayList(0);
  }
  
  public void addToolAction(ToolActionVO paramToolActionVO)
  {
    if (paramToolActionVO != null) {
      toolActions.add(paramToolActionVO);
    }
  }
  
  public List<ToolActionVO> getToolActions()
  {
    return toolActions;
  }
  
  public String getToolId()
  {
    return toolId;
  }
  
  public int getToolVersion()
  {
    return toolVersion;
  }
  
  public void reset()
  {
    toolActions.clear();
  }
  
  public void setToolAction(ToolActionVO paramToolActionVO)
  {
    toolActions.clear();
    if (paramToolActionVO != null) {
      toolActions.add(paramToolActionVO);
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("EditVO{ ");
    localStringBuilder.append("toolId:" + toolId);
    localStringBuilder.append(", toolVersion:" + toolVersion);
    localStringBuilder.append(", edit:" + toolActions.toString());
    localStringBuilder.append(" }");
    return localStringBuilder.toString();
  }
}
