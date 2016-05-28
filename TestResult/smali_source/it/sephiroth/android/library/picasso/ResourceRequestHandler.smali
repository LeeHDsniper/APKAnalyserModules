.class Lit/sephiroth/android/library/picasso/ResourceRequestHandler;
.super Lit/sephiroth/android/library/picasso/RequestHandler;
.source "ResourceRequestHandler.java"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/RequestHandler;-><init>()V

    .line 31
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;->context:Landroid/content/Context;

    .line 32
    return-void
.end method

.method private static decodeResource(Landroid/content/res/Resources;ILit/sephiroth/android/library/picasso/Request;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .param p2, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 49
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;->createBitmapOptions(Lit/sephiroth/android/library/picasso/Request;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    .line 50
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-static {v0}, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;->requiresInSampleSize(Landroid/graphics/BitmapFactory$Options;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 51
    invoke-static {p0, p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 52
    iget v1, p2, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    iget v2, p2, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    invoke-static {v1, v2, v0, p2}, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;->calculateInSampleSize(IILandroid/graphics/BitmapFactory$Options;Lit/sephiroth/android/library/picasso/Request;)V

    .line 54
    :cond_14
    invoke-static {p0, p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 4
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 35
    iget v0, p1, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    if-eqz v0, :cond_6

    .line 36
    const/4 v0, 0x1

    .line 39
    :goto_5
    return v0

    :cond_6
    const-string v0, "android.resource"

    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .registers 8
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;->context:Landroid/content/Context;

    invoke-static {v2, p1}, Lit/sephiroth/android/library/picasso/Utils;->getResources(Landroid/content/Context;Lit/sephiroth/android/library/picasso/Request;)Landroid/content/res/Resources;

    move-result-object v1

    .line 44
    .local v1, "res":Landroid/content/res/Resources;
    invoke-static {v1, p1}, Lit/sephiroth/android/library/picasso/Utils;->getResourceId(Landroid/content/res/Resources;Lit/sephiroth/android/library/picasso/Request;)I

    move-result v0

    .line 45
    .local v0, "id":I
    new-instance v2, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    invoke-static {v1, v0, p1}, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;->decodeResource(Landroid/content/res/Resources;ILit/sephiroth/android/library/picasso/Request;)Landroid/graphics/Bitmap;

    move-result-object v3

    sget-object v4, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v2, v3, v4}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    return-object v2
.end method
