.class Lit/sephiroth/android/library/picasso/Picasso$CleanupThread$1;
.super Ljava/lang/Object;
.source "Picasso.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;

.field final synthetic val$e:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;Ljava/lang/Exception;)V
    .registers 3
    .param p1, "this$0"    # Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;

    .prologue
    .line 683
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread$1;->this$0:Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;

    iput-object p2, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread$1;->val$e:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 685
    new-instance v0, Ljava/lang/RuntimeException;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread$1;->val$e:Ljava/lang/Exception;

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
