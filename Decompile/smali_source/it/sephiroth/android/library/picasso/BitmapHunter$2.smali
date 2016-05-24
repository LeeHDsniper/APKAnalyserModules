.class final Lit/sephiroth/android/library/picasso/BitmapHunter$2;
.super Lit/sephiroth/android/library/picasso/RequestHandler;
.source "BitmapHunter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/BitmapHunter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 48
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/RequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 3
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 50
    const/4 v0, 0x1

    return v0
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
    .line 54
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized type of request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
