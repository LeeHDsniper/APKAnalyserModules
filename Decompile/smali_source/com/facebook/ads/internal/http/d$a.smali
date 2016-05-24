.class Lcom/facebook/ads/internal/http/d$a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/internal/http/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/io/InputStream;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# virtual methods
.method public a()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/http/d$a;->b:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/facebook/ads/internal/http/d$a;->b:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "nofilename"

    goto :goto_6
.end method
