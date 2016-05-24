.class public Lcom/behance/sdk/project/modules/EmbedModule;
.super Lcom/behance/sdk/project/modules/BaseModule;
.source "EmbedModule.java"


# static fields
.field private static final serialVersionUID:J = 0x206e1c1d40c71348L


# instance fields
.field private embedContentTxt:Ljava/lang/String;

.field private order:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "embedContentTxt"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/BaseModule;-><init>()V

    .line 36
    const-string v0, "src=\"//"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 37
    const-string v0, "src=\"//"

    const-string v1, "src=\"http://"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/project/modules/EmbedModule;->embedContentTxt:Ljava/lang/String;

    .line 40
    :goto_15
    return-void

    .line 39
    :cond_16
    iput-object p1, p0, Lcom/behance/sdk/project/modules/EmbedModule;->embedContentTxt:Ljava/lang/String;

    goto :goto_15
.end method


# virtual methods
.method public clear()V
    .registers 1

    .prologue
    .line 58
    return-void
.end method

.method public getDescription()Ljava/lang/String;
    .registers 3

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Embed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/behance/sdk/project/modules/EmbedModule;->order:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmbedContent()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/behance/sdk/project/modules/EmbedModule;->embedContentTxt:Ljava/lang/String;

    return-object v0
.end method

.method public getSubDescription()Ljava/lang/String;
    .registers 3

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "m"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/behance/sdk/project/modules/EmbedModule;->order:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".behance.net"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    .registers 2

    .prologue
    .line 47
    sget-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    return-object v0
.end method

.method public setOrder(I)V
    .registers 2
    .param p1, "order"    # I

    .prologue
    .line 65
    iput p1, p0, Lcom/behance/sdk/project/modules/EmbedModule;->order:I

    .line 66
    return-void
.end method
