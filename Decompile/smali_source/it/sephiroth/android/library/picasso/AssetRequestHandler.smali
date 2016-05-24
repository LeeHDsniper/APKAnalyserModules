.class Lit/sephiroth/android/library/picasso/AssetRequestHandler;
.super Lit/sephiroth/android/library/picasso/RequestHandler;
.source "AssetRequestHandler.java"


# static fields
.field private static final ASSET_PREFIX_LENGTH:I


# instance fields
.field private final assetManager:Landroid/content/res/AssetManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-string v0, "file:///android_asset/"

    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lit/sephiroth/android/library/picasso/AssetRequestHandler;->ASSET_PREFIX_LENGTH:I

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/RequestHandler;-><init>()V

    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/AssetRequestHandler;->assetManager:Landroid/content/res/AssetManager;

    .line 35
    return-void
.end method

.method static getFilePath(Lit/sephiroth/android/library/picasso/Request;)Ljava/lang/String;
    .registers 3
    .param p0, "request"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 49
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    sget v1, Lit/sephiroth/android/library/picasso/AssetRequestHandler;->ASSET_PREFIX_LENGTH:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 6
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    const/4 v1, 0x0

    .line 38
    iget-object v0, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    .line 39
    .local v0, "uri":Landroid/net/Uri;
    const-string v2, "file"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 40
    invoke-virtual {v0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2a

    const-string v2, "android_asset"

    invoke-virtual {v0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    const/4 v1, 0x1

    :cond_2a
    return v1
.end method

.method public load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .registers 6
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/AssetRequestHandler;->assetManager:Landroid/content/res/AssetManager;

    invoke-static {p1}, Lit/sephiroth/android/library/picasso/AssetRequestHandler;->getFilePath(Lit/sephiroth/android/library/picasso/Request;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 45
    .local v0, "is":Ljava/io/InputStream;
    new-instance v1, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    sget-object v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v1, v0, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    return-object v1
.end method
