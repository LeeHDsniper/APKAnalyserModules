.class Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;
.super Ljava/lang/ref/WeakReference;
.source "Action.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Action;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RequestWeakReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/ref/WeakReference",
        "<TM;>;"
    }
.end annotation


# instance fields
.field final action:Lit/sephiroth/android/library/picasso/Action;


# direct methods
.method public constructor <init>(Lit/sephiroth/android/library/picasso/Action;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    .registers 4
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lit/sephiroth/android/library/picasso/Action;",
            "TM;",
            "Ljava/lang/ref/ReferenceQueue",
            "<-TM;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;, "Lit/sephiroth/android/library/picasso/Action$RequestWeakReference<TM;>;"
    .local p2, "referent":Ljava/lang/Object;, "TM;"
    .local p3, "q":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<-TM;>;"
    invoke-direct {p0, p2, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 29
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Action$RequestWeakReference;->action:Lit/sephiroth/android/library/picasso/Action;

    .line 30
    return-void
.end method
