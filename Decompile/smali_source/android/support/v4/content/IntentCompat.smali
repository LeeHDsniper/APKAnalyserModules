.class public Landroid/support/v4/content/IntentCompat;
.super Ljava/lang/Object;
.source "IntentCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/content/IntentCompat$IntentCompatImplIcsMr1;,
        Landroid/support/v4/content/IntentCompat$IntentCompatImplHC;,
        Landroid/support/v4/content/IntentCompat$IntentCompatImplBase;,
        Landroid/support/v4/content/IntentCompat$IntentCompatImpl;
    }
.end annotation


# static fields
.field private static final IMPL:Landroid/support/v4/content/IntentCompat$IntentCompatImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 85
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 86
    .local v0, "version":I
    const/16 v1, 0xf

    if-lt v0, v1, :cond_e

    .line 87
    new-instance v1, Landroid/support/v4/content/IntentCompat$IntentCompatImplIcsMr1;

    invoke-direct {v1}, Landroid/support/v4/content/IntentCompat$IntentCompatImplIcsMr1;-><init>()V

    sput-object v1, Landroid/support/v4/content/IntentCompat;->IMPL:Landroid/support/v4/content/IntentCompat$IntentCompatImpl;

    .line 93
    :goto_d
    return-void

    .line 88
    :cond_e
    const/16 v1, 0xb

    if-lt v0, v1, :cond_1a

    .line 89
    new-instance v1, Landroid/support/v4/content/IntentCompat$IntentCompatImplHC;

    invoke-direct {v1}, Landroid/support/v4/content/IntentCompat$IntentCompatImplHC;-><init>()V

    sput-object v1, Landroid/support/v4/content/IntentCompat;->IMPL:Landroid/support/v4/content/IntentCompat$IntentCompatImpl;

    goto :goto_d

    .line 91
    :cond_1a
    new-instance v1, Landroid/support/v4/content/IntentCompat$IntentCompatImplBase;

    invoke-direct {v1}, Landroid/support/v4/content/IntentCompat$IntentCompatImplBase;-><init>()V

    sput-object v1, Landroid/support/v4/content/IntentCompat;->IMPL:Landroid/support/v4/content/IntentCompat$IntentCompatImpl;

    goto :goto_d
.end method

.method public static makeMainActivity(Landroid/content/ComponentName;)Landroid/content/Intent;
    .registers 2
    .param p0, "mainActivity"    # Landroid/content/ComponentName;

    .prologue
    .line 221
    sget-object v0, Landroid/support/v4/content/IntentCompat;->IMPL:Landroid/support/v4/content/IntentCompat$IntentCompatImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/content/IntentCompat$IntentCompatImpl;->makeMainActivity(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method
