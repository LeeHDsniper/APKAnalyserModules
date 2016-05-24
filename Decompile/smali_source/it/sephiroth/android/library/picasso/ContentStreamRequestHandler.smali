.class Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;
.super Lit/sephiroth/android/library/picasso/RequestHandler;
.source "ContentStreamRequestHandler.java"


# instance fields
.field final context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/RequestHandler;-><init>()V

    .line 30
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;->context:Landroid/content/Context;

    .line 31
    return-void
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 4
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 34
    const-string v0, "content"

    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method getInputStream(Lit/sephiroth/android/library/picasso/Request;)Ljava/io/InputStream;
    .registers 4
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 43
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    return-object v1
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
    .line 38
    new-instance v0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;->getInputStream(Lit/sephiroth/android/library/picasso/Request;)Ljava/io/InputStream;

    move-result-object v1

    sget-object v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v0, v1, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    return-object v0
.end method
