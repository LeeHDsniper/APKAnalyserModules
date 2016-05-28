.class Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$3;
.super Ljava/lang/Object;
.source "InfoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;


# direct methods
.method constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;)V
    .registers 2

    .prologue
    .line 121
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$3;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$3;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;

    # invokes: Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->adobeSignOut()V
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->access$000(Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;)V

    .line 124
    return-void
.end method
