package com.adobe.creativesdk.aviary.internal.vo;

import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import java.util.List;

public class EditToolResultVO
{
  MoaActionList actionList;
  final EditToolVO editTool;
  
  public EditToolResultVO(String paramString, int paramInt)
  {
    editTool = new EditToolVO(paramString, paramInt);
  }
  
  public void addToolAction(ToolActionVO paramToolActionVO)
  {
    editTool.addToolAction(paramToolActionVO);
  }
  
  public MoaActionList getActionList()
  {
    return actionList;
  }
  
  public EditToolVO getEditTool()
  {
    return editTool;
  }
  
  public List<ToolActionVO> getToolActions()
  {
    return editTool.getToolActions();
  }
  
  public String getToolId()
  {
    return editTool.getToolId();
  }
  
  public int getToolVersion()
  {
    return editTool.getToolVersion();
  }
  
  public void reset()
  {
    if (actionList != null) {
      actionList.clear();
    }
    editTool.reset();
  }
  
  public void setActionList(MoaActionList paramMoaActionList)
  {
    actionList = paramMoaActionList;
  }
  
  public void setToolAction(ToolActionVO paramToolActionVO)
  {
    editTool.setToolAction(paramToolActionVO);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("EditToolResultVO{ ");
    if (valid())
    {
      localStringBuilder.append("toolId:" + getToolId());
      localStringBuilder.append(", toolVersion:" + getToolVersion());
      localStringBuilder.append(", actions:" + actionList.size());
      localStringBuilder.append(", edit:" + getToolActions().toString());
    }
    for (;;)
    {
      localStringBuilder.append(" }");
      return localStringBuilder.toString();
      localStringBuilder.append("INVALID");
    }
  }
  
  public boolean valid()
  {
    return (actionList != null) && (actionList.size() > 0);
  }
}
