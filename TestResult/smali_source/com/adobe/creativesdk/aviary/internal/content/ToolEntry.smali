.class public final Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
.super Ljava/lang/Object;
.source "ToolEntry.java"


# instance fields
.field public iconResourceId:I

.field public labelResourceId:I

.field public name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V
    .registers 4
    .param p1, "effectId"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .param p2, "iconId"    # I
    .param p3, "labelId"    # I

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 27
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->iconResourceId:I

    .line 28
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->labelResourceId:I

    .line 29
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
