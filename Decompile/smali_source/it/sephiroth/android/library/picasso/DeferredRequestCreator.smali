.class Lit/sephiroth/android/library/picasso/DeferredRequestCreator;
.super Ljava/lang/Object;
.source "DeferredRequestCreator.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field callback:Lit/sephiroth/android/library/picasso/Callback;

.field final creator:Lit/sephiroth/android/library/picasso/RequestCreator;

.field final target:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field final targetIsHidden:Z


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/picasso/RequestCreator;Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;Z)V
    .registers 6
    .param p1, "creator"    # Lit/sephiroth/android/library/picasso/RequestCreator;
    .param p2, "target"    # Landroid/widget/ImageView;
    .param p3, "callback"    # Lit/sephiroth/android/library/picasso/Callback;
    .param p4, "targetIsHidden"    # Z

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->creator:Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 37
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->target:Ljava/lang/ref/WeakReference;

    .line 38
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->callback:Lit/sephiroth/android/library/picasso/Callback;

    .line 39
    iput-boolean p4, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->targetIsHidden:Z

    .line 40
    invoke-virtual {p2}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 41
    return-void
.end method


# virtual methods
.method cancel()V
    .registers 4

    .prologue
    .line 74
    const/4 v2, 0x0

    iput-object v2, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->callback:Lit/sephiroth/android/library/picasso/Callback;

    .line 75
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 76
    .local v0, "target":Landroid/widget/ImageView;
    if-nez v0, :cond_e

    .line 84
    :cond_d
    :goto_d
    return-void

    .line 79
    :cond_e
    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    .line 80
    .local v1, "vto":Landroid/view/ViewTreeObserver;
    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 83
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_d
.end method

.method public onPreDraw()Z
    .registers 8

    .prologue
    const/4 v6, 0x1

    .line 44
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 45
    .local v1, "target":Landroid/widget/ImageView;
    if-nez v1, :cond_c

    .line 70
    :cond_b
    :goto_b
    return v6

    .line 48
    :cond_c
    invoke-virtual {v1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    .line 49
    .local v2, "vto":Landroid/view/ViewTreeObserver;
    invoke-virtual {v2}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 55
    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_22

    iget-boolean v4, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->targetIsHidden:Z

    if-eqz v4, :cond_41

    .line 56
    :cond_22
    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v3

    .line 57
    .local v3, "width":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v0

    .line 63
    .local v0, "height":I
    :goto_2a
    if-lez v3, :cond_b

    if-lez v0, :cond_b

    .line 67
    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 69
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->creator:Lit/sephiroth/android/library/picasso/RequestCreator;

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/RequestCreator;->unfit()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    invoke-virtual {v4, v3, v0}, Lit/sephiroth/android/library/picasso/RequestCreator;->resize(II)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    iget-object v5, p0, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->callback:Lit/sephiroth/android/library/picasso/Callback;

    invoke-virtual {v4, v1, v5}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    goto :goto_b

    .line 59
    .end local v0    # "height":I
    .end local v3    # "width":I
    :cond_41
    invoke-virtual {v1}, Landroid/widget/ImageView;->getWidth()I

    move-result v3

    .line 60
    .restart local v3    # "width":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    .restart local v0    # "height":I
    goto :goto_2a
.end method
