.class Lit/sephiroth/android/library/picasso/Stats$StatsHandler$1;
.super Ljava/lang/Object;
.source "Stats.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/picasso/Stats$StatsHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/picasso/Stats$StatsHandler;

.field final synthetic val$msg:Landroid/os/Message;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/picasso/Stats$StatsHandler;Landroid/os/Message;)V
    .registers 3
    .param p1, "this$0"    # Lit/sephiroth/android/library/picasso/Stats$StatsHandler;

    .prologue
    .line 153
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Stats$StatsHandler$1;->this$0:Lit/sephiroth/android/library/picasso/Stats$StatsHandler;

    iput-object p2, p0, Lit/sephiroth/android/library/picasso/Stats$StatsHandler$1;->val$msg:Landroid/os/Message;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 155
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unhandled stats message."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Stats$StatsHandler$1;->val$msg:Landroid/os/Message;

    iget v2, v2, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
