.class Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventStubImpl;
.super Ljava/lang/Object;
.source "AccessibilityEventCompat.java"

# interfaces
.implements Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/accessibility/AccessibilityEventCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AccessibilityEventStubImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;)I
    .registers 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 60
    const/4 v0, 0x0

    return v0
.end method

.method public setContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;I)V
    .registers 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .param p2, "types"    # I

    .prologue
    .line 51
    return-void
.end method
