.class public Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;
.super Ljava/lang/Object;
.source "EditToolResultVO.java"


# instance fields
.field actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

.field final editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .param p1, "toolId"    # Ljava/lang/String;
    .param p2, "toolVersion"    # I

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    invoke-direct {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    .line 18
    return-void
.end method


# virtual methods
.method public addToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V
    .registers 3
    .param p1, "action"    # Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->addToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 60
    return-void
.end method

.method public getActionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    return-object v0
.end method

.method public getEditTool()Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;
    .registers 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    return-object v0
.end method

.method public getToolActions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->getToolActions()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getToolId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->getToolId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getToolVersion()I
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->getToolVersion()I

    move-result v0

    return v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    if-eqz v0, :cond_9

    .line 82
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->clear()V

    .line 84
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->reset()V

    .line 85
    return-void
.end method

.method public setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 2
    .param p1, "actionList"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 46
    return-void
.end method

.method public setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V
    .registers 3
    .param p1, "action"    # Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->editTool:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 56
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "EditToolResultVO{ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->valid()Z

    move-result v1

    if-eqz v1, :cond_88

    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "toolId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getToolId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", toolVersion:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getToolVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", actions:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", edit:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getToolActions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    :goto_7e
    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 73
    :cond_88
    const-string v1, "INVALID"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7e
.end method

.method public valid()Z
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->actionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->size()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
