.class Landroid/support/v7/internal/app/ToolbarActionBar$1;
.super Ljava/lang/Object;
.source "ToolbarActionBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/app/ToolbarActionBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/internal/app/ToolbarActionBar;


# direct methods
.method constructor <init>(Landroid/support/v7/internal/app/ToolbarActionBar;)V
    .registers 2

    .prologue
    .line 61
    iput-object p1, p0, Landroid/support/v7/internal/app/ToolbarActionBar$1;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Landroid/support/v7/internal/app/ToolbarActionBar$1;->this$0:Landroid/support/v7/internal/app/ToolbarActionBar;

    invoke-virtual {v0}, Landroid/support/v7/internal/app/ToolbarActionBar;->populateOptionsMenu()V

    .line 65
    return-void
.end method
