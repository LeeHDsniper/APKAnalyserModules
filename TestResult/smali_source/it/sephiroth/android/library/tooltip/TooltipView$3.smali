.class Lit/sephiroth/android/library/tooltip/TooltipView$3;
.super Ljava/lang/Object;
.source "TooltipView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/tooltip/TooltipView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/tooltip/TooltipView;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 2

    .prologue
    .line 207
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipView$3;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 210
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$3;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    # invokes: Lit/sephiroth/android/library/tooltip/TooltipView;->onClose(ZZ)V
    invoke-static {v0, v1, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->access$300(Lit/sephiroth/android/library/tooltip/TooltipView;ZZ)V

    .line 211
    return-void
.end method
