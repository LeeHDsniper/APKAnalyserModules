.class public Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;
.super Ljava/lang/Object;
.source "EditToolVO.java"


# instance fields
.field final toolActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;",
            ">;"
        }
    .end annotation
.end field

.field final toolId:Ljava/lang/String;

.field final toolVersion:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .param p1, "toolId"    # Ljava/lang/String;
    .param p2, "toolVersion"    # I

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolId:Ljava/lang/String;

    .line 19
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolVersion:I

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolActions:Ljava/util/List;

    .line 21
    return-void
.end method


# virtual methods
.method public addToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V
    .registers 3
    .param p1, "action"    # Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .prologue
    .line 49
    if-eqz p1, :cond_7

    .line 50
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolActions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    :cond_7
    return-void
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
    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolActions:Ljava/util/List;

    return-object v0
.end method

.method public getToolId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolId:Ljava/lang/String;

    return-object v0
.end method

.method public getToolVersion()I
    .registers 2

    .prologue
    .line 28
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolVersion:I

    return v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolActions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 67
    return-void
.end method

.method public setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V
    .registers 3
    .param p1, "action"    # Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolActions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 43
    if-eqz p1, :cond_c

    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolActions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    :cond_c
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "EditVO{ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "toolId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", toolVersion:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", edit:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;->toolActions:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
