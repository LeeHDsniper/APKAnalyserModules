.class public Landroid/support/v4/view/GravityCompat;
.super Ljava/lang/Object;
.source "GravityCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/GravityCompat$GravityCompatImplJellybeanMr1;,
        Landroid/support/v4/view/GravityCompat$GravityCompatImplBase;,
        Landroid/support/v4/view/GravityCompat$GravityCompatImpl;
    }
.end annotation


# static fields
.field static final IMPL:Landroid/support/v4/view/GravityCompat$GravityCompatImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 89
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 90
    .local v0, "version":I
    const/16 v1, 0x11

    if-lt v0, v1, :cond_e

    .line 91
    new-instance v1, Landroid/support/v4/view/GravityCompat$GravityCompatImplJellybeanMr1;

    invoke-direct {v1}, Landroid/support/v4/view/GravityCompat$GravityCompatImplJellybeanMr1;-><init>()V

    sput-object v1, Landroid/support/v4/view/GravityCompat;->IMPL:Landroid/support/v4/view/GravityCompat$GravityCompatImpl;

    .line 95
    :goto_d
    return-void

    .line 93
    :cond_e
    new-instance v1, Landroid/support/v4/view/GravityCompat$GravityCompatImplBase;

    invoke-direct {v1}, Landroid/support/v4/view/GravityCompat$GravityCompatImplBase;-><init>()V

    sput-object v1, Landroid/support/v4/view/GravityCompat;->IMPL:Landroid/support/v4/view/GravityCompat$GravityCompatImpl;

    goto :goto_d
.end method

.method public static apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V
    .registers 13
    .param p0, "gravity"    # I
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "container"    # Landroid/graphics/Rect;
    .param p4, "outRect"    # Landroid/graphics/Rect;
    .param p5, "layoutDirection"    # I

    .prologue
    .line 132
    sget-object v0, Landroid/support/v4/view/GravityCompat;->IMPL:Landroid/support/v4/view/GravityCompat$GravityCompatImpl;

    move v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-interface/range {v0 .. v6}, Landroid/support/v4/view/GravityCompat$GravityCompatImpl;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 133
    return-void
.end method

.method public static getAbsoluteGravity(II)I
    .registers 3
    .param p0, "gravity"    # I
    .param p1, "layoutDirection"    # I

    .prologue
    .line 201
    sget-object v0, Landroid/support/v4/view/GravityCompat;->IMPL:Landroid/support/v4/view/GravityCompat$GravityCompatImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/view/GravityCompat$GravityCompatImpl;->getAbsoluteGravity(II)I

    move-result v0

    return v0
.end method
