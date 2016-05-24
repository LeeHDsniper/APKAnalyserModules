.class final Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer$1;
.super Ljava/lang/Object;
.source "Picasso.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transformRequest(Lit/sephiroth/android/library/picasso/Request;)Lit/sephiroth/android/library/picasso/Request;
    .registers 2
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 86
    return-object p1
.end method
