.class abstract Lit/sephiroth/android/library/picasso/Action;
.super Ljava/lang/Object;
.source "Action.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field cancelled:Z

.field final errorDrawable:Landroid/graphics/drawable/Drawable;

.field final errorResId:I

.field fadeTime:J

.field final key:Ljava/lang/String;

.field final memoryPolicy:I

.field final networkPolicy:I

.field final picasso:Lit/sephiroth/android/library/picasso/Picasso;

.field final request:Lit/sephiroth/android/library/picasso/Request;

.field final tag:Ljava/lang/Object;

.field final target:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<TT;>;"
        }
    .end annotation
.end field

.field willReplay:Z


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/picasso/Picasso;Ljava/lang/Object;Lit/sephiroth/android/library/picasso/Request;IIILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;J)V
    .registers 14
    .param p1, "picasso"    # Lit/sephiroth/android/library/picasso/Picasso;
    .param p3, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p4, "memoryPolicy"    # I
    .param p5, "networkPolicy"    # I
    .param p6, "errorResId"    # I
    .param p7, "errorDrawable"    # Landroid/graphics/drawable/Drawable;
    .param p8, "key"    # Ljava/lang/String;
    .param p9, "tag"    # Ljava/lang/Object;
    .param p10, "fadeTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lit/sephiroth/android/library/picasso/Picasso;",
            "TT;",
            "Lit/sephiroth/android/library/picasso/Request;",
            "III",
            "Landroid/graphics/drawable/Drawable;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    .local p2, "target":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Action;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 50
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    .line 51
    if-nez p2, :cond_1d

    const/4 v0, 0x0

    :goto_a
    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->target:Ljava/lang/ref/WeakReference;

    .line 53
    iput p4, p0, Lit/sephiroth/android/library/picasso/Action;->memoryPolicy:I

    .line 54
    iput p5, p0, Lit/sephiroth/android/library/picasso/Action;->networkPolicy:I

    .line 55
    iput-wide p10, p0, Lit/sephiroth/android/library/picasso/Action;->fadeTime:J

    .line 56
    iput p6, p0, Lit/sephiroth/android/library/picasso/Action;->errorResId:I

    .line 57
    iput-object p7, p0, Lit/sephiroth/android/library/picasso/Action;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 58
    iput-object p8, p0, Lit/sephiroth/android/library/picasso/Action;->key:Ljava/lang/String;

    .line 59
    if-eqz p9, :cond_25

    .end local p9    # "tag":Ljava/lang/Object;
    :goto_1a
    iput-object p9, p0, Lit/sephiroth/android/library/picasso/Action;->tag:Ljava/lang/Object;

    .line 60
    return-void

    .line 51
    .restart local p9    # "tag":Ljava/lang/Object;
    :cond_1d
    new-instance v0, Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;

    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Picasso;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0, p0, p2, v1}, Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;-><init>(Lit/sephiroth/android/library/picasso/Action;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    goto :goto_a

    :cond_25
    move-object p9, p0

    .line 59
    goto :goto_1a
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 67
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Action;->cancelled:Z

    .line 68
    return-void
.end method

.method abstract complete(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V
.end method

.method abstract error()V
.end method

.method getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->key:Ljava/lang/String;

    return-object v0
.end method

.method getMemoryPolicy()I
    .registers 2

    .prologue
    .line 91
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget v0, p0, Lit/sephiroth/android/library/picasso/Action;->memoryPolicy:I

    return v0
.end method

.method getNetworkPolicy()I
    .registers 2

    .prologue
    .line 95
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget v0, p0, Lit/sephiroth/android/library/picasso/Action;->networkPolicy:I

    return v0
.end method

.method getPicasso()Lit/sephiroth/android/library/picasso/Picasso;
    .registers 2

    .prologue
    .line 99
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    return-object v0
.end method

.method getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .registers 2

    .prologue
    .line 103
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/Request;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    return-object v0
.end method

.method getRequest()Lit/sephiroth/android/library/picasso/Request;
    .registers 2

    .prologue
    .line 71
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    return-object v0
.end method

.method getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 107
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method getTarget()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->target:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Action;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method isCancelled()Z
    .registers 2

    .prologue
    .line 83
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Action;->cancelled:Z

    return v0
.end method

.method willReplay()Z
    .registers 2

    .prologue
    .line 87
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action;, "Lit/sephiroth/android/library/picasso/Action<TT;>;"
    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Action;->willReplay:Z

    return v0
.end method
