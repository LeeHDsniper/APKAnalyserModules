.class public Landroid/support/v4/view/accessibility/AccessibilityEventCompat;
.super Ljava/lang/Object;
.source "AccessibilityEventCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventKitKatImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventIcsImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventStubImpl;,
        Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;
    }
.end annotation


# static fields
.field private static final IMPL:Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 98
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_e

    .line 99
    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventKitKatImpl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventKitKatImpl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;

    .line 105
    :goto_d
    return-void

    .line 100
    :cond_e
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1c

    .line 101
    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventIcsImpl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventIcsImpl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;

    goto :goto_d

    .line 103
    :cond_1c
    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventStubImpl;

    invoke-direct {v0}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventStubImpl;-><init>()V

    sput-object v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;

    goto :goto_d
.end method

.method public static asRecord(Landroid/view/accessibility/AccessibilityEvent;)Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 284
    new-instance v0, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;

    invoke-direct {v0, p0}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static getContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;)I
    .registers 2
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 313
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;->getContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;)I

    move-result v0

    return v0
.end method

.method public static setContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;I)V
    .registers 3
    .param p0, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .param p1, "changeTypes"    # I

    .prologue
    .line 296
    sget-object v0, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->IMPL:Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat$AccessibilityEventVersionImpl;->setContentChangeTypes(Landroid/view/accessibility/AccessibilityEvent;I)V

    .line 297
    return-void
.end method
