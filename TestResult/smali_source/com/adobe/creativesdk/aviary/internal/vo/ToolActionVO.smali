.class public Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
.super Ljava/lang/Object;
.source "ToolActionVO.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field contentIdentifier:Ljava/lang/String;

.field packIdentifier:Ljava/lang/String;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->value:Ljava/lang/Object;

    .line 15
    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<TT;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public setContentIdentifier(Ljava/lang/String;)V
    .registers 2
    .param p1, "contentIdentifier"    # Ljava/lang/String;

    .prologue
    .line 26
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<TT;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->contentIdentifier:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public setPackIdentifier(Ljava/lang/String;)V
    .registers 2
    .param p1, "packIdentifier"    # Ljava/lang/String;

    .prologue
    .line 22
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<TT;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->packIdentifier:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->value:Ljava/lang/Object;

    .line 19
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 44
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ToolActionVO{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->value:Ljava/lang/Object;

    if-eqz v1, :cond_23

    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->value:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    :cond_23
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->packIdentifier:Ljava/lang/String;

    if-eqz v1, :cond_60

    .line 50
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->value:Ljava/lang/Object;

    if-eqz v1, :cond_30

    .line 51
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    :cond_30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pack:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->packIdentifier:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", content:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->contentIdentifier:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    :cond_60
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
