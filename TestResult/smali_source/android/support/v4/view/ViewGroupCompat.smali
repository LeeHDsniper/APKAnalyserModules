.class public Landroid/support/v4/view/ViewGroupCompat;
.super Ljava/lang/Object;
.source "ViewGroupCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatLollipopImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatJellybeanMR2Impl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatIcsImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatHCImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatStubImpl;,
        Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;
    }
.end annotation


# static fields
.field static final IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 141
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 142
    .local v0, "version":I
    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 143
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatLollipopImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatLollipopImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    .line 153
    :goto_d
    return-void

    .line 144
    :cond_e
    const/16 v1, 0x12

    if-lt v0, v1, :cond_1a

    .line 145
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatJellybeanMR2Impl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatJellybeanMR2Impl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_d

    .line 146
    :cond_1a
    const/16 v1, 0xe

    if-lt v0, v1, :cond_26

    .line 147
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatIcsImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatIcsImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_d

    .line 148
    :cond_26
    const/16 v1, 0xb

    if-lt v0, v1, :cond_32

    .line 149
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatHCImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatHCImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_d

    .line 151
    :cond_32
    new-instance v1, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatStubImpl;

    invoke-direct {v1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatStubImpl;-><init>()V

    sput-object v1, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    goto :goto_d
.end method

.method public static setMotionEventSplittingEnabled(Landroid/view/ViewGroup;Z)V
    .registers 3
    .param p0, "group"    # Landroid/view/ViewGroup;
    .param p1, "split"    # Z

    .prologue
    .line 199
    sget-object v0, Landroid/support/v4/view/ViewGroupCompat;->IMPL:Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/view/ViewGroupCompat$ViewGroupCompatImpl;->setMotionEventSplittingEnabled(Landroid/view/ViewGroup;Z)V

    .line 200
    return-void
.end method
