.class Landroid/support/v4/view/KeyEventCompat$EclairKeyEventVersionImpl;
.super Landroid/support/v4/view/KeyEventCompat$BaseKeyEventVersionImpl;
.source "KeyEventCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/KeyEventCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EclairKeyEventVersionImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 118
    invoke-direct {p0}, Landroid/support/v4/view/KeyEventCompat$BaseKeyEventVersionImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public startTracking(Landroid/view/KeyEvent;)V
    .registers 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 121
    invoke-static {p1}, Landroid/support/v4/view/KeyEventCompatEclair;->startTracking(Landroid/view/KeyEvent;)V

    .line 122
    return-void
.end method
