.class public Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;
.super Ljava/lang/Object;
.source "PackIconTransformer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field generatePalette:Z

.field overlayGravity:I

.field overlayPadding:I

.field overlayResId:I

.field packType:Ljava/lang/String;

.field path:Ljava/lang/String;

.field resources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput v0, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayResId:I

    .line 30
    iput v0, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayPadding:I

    .line 33
    return-void
.end method


# virtual methods
.method public build()Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    .registers 4

    .prologue
    .line 63
    new-instance v0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;-><init>()V

    .line 65
    .local v0, "instance":Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->path:Ljava/lang/String;

    if-nez v1, :cond_11

    .line 66
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "path is required"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    :cond_11
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->packType:Ljava/lang/String;

    if-nez v1, :cond_1d

    .line 69
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "packType cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_1d
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->resources:Landroid/content/res/Resources;

    if-nez v1, :cond_29

    .line 72
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "resources cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :cond_29
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->path:Ljava/lang/String;

    # setter for: Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->imagePath:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->access$002(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->packType:Ljava/lang/String;

    # setter for: Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->packType:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->access$102(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;Ljava/lang/String;)Ljava/lang/String;

    .line 77
    new-instance v1, Ljava/lang/ref/SoftReference;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->resources:Landroid/content/res/Resources;

    invoke-direct {v1, v2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->resourcesRef:Ljava/lang/ref/SoftReference;

    .line 78
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->generatePalette:Z

    # setter for: Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->generatePalette:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->access$202(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;Z)Z

    .line 79
    iget v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayResId:I

    # setter for: Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayResId:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->access$302(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;I)I

    .line 80
    iget v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayPadding:I

    # setter for: Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayPadding:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->access$402(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;I)I

    .line 81
    iget v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayGravity:I

    # setter for: Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->access$502(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;I)I

    .line 82
    return-object v0
.end method

.method public withOverlay(III)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;
    .registers 4
    .param p1, "resId"    # I
    .param p2, "gravity"    # I
    .param p3, "padding"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayResId:I

    .line 57
    iput p3, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayPadding:I

    .line 58
    iput p2, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->overlayGravity:I

    .line 59
    return-object p0
.end method

.method public withPackType(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;
    .registers 2
    .param p1, "packType"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->packType:Ljava/lang/String;

    .line 47
    return-object p0
.end method

.method public withPalette(Z)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->generatePalette:Z

    .line 42
    return-object p0
.end method

.method public withPath(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;
    .registers 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->path:Ljava/lang/String;

    .line 52
    return-object p0
.end method

.method public withResources(Landroid/content/res/Resources;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;
    .registers 2
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->resources:Landroid/content/res/Resources;

    .line 37
    return-object p0
.end method
