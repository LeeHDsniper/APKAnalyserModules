.class public final Landroid/support/v7/internal/view/menu/MenuWrapperFactory;
.super Ljava/lang/Object;
.source "MenuWrapperFactory.java"


# direct methods
.method public static wrapSupportMenu(Landroid/content/Context;Landroid/support/v4/internal/view/SupportMenu;)Landroid/view/Menu;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "supportMenu"    # Landroid/support/v4/internal/view/SupportMenu;

    .prologue
    .line 36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_c

    .line 37
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuWrapperICS;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/internal/view/menu/MenuWrapperICS;-><init>(Landroid/content/Context;Landroid/support/v4/internal/view/SupportMenu;)V

    return-object v0

    .line 39
    :cond_c
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public static wrapSupportMenuItem(Landroid/content/Context;Landroid/support/v4/internal/view/SupportMenuItem;)Landroid/view/MenuItem;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "supportMenuItem"    # Landroid/support/v4/internal/view/SupportMenuItem;

    .prologue
    .line 43
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_c

    .line 44
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuItemWrapperJB;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemWrapperJB;-><init>(Landroid/content/Context;Landroid/support/v4/internal/view/SupportMenuItem;)V

    .line 46
    :goto_b
    return-object v0

    .line 45
    :cond_c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_18

    .line 46
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuItemWrapperICS;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemWrapperICS;-><init>(Landroid/content/Context;Landroid/support/v4/internal/view/SupportMenuItem;)V

    goto :goto_b

    .line 48
    :cond_18
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public static wrapSupportSubMenu(Landroid/content/Context;Landroid/support/v4/internal/view/SupportSubMenu;)Landroid/view/SubMenu;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "supportSubMenu"    # Landroid/support/v4/internal/view/SupportSubMenu;

    .prologue
    .line 52
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_c

    .line 53
    new-instance v0, Landroid/support/v7/internal/view/menu/SubMenuWrapperICS;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/internal/view/menu/SubMenuWrapperICS;-><init>(Landroid/content/Context;Landroid/support/v4/internal/view/SupportSubMenu;)V

    return-object v0

    .line 55
    :cond_c
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
