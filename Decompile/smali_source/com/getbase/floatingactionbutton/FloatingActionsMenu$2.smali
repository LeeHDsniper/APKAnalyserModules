.class Lcom/getbase/floatingactionbutton/FloatingActionsMenu$2;
.super Ljava/lang/Object;
.source "FloatingActionsMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->createAddButton(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;


# direct methods
.method constructor <init>(Lcom/getbase/floatingactionbutton/FloatingActionsMenu;)V
    .registers 2
    .param p1, "this$0"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$2;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$2;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionsMenu;

    invoke-virtual {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu;->toggle()V

    .line 182
    return-void
.end method
