.class Lcom/google/android/gms/internal/zzey$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzey;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzzF:Ljava/lang/String;

.field final synthetic zzzG:Ljava/lang/String;

.field final synthetic zzzH:Lcom/google/android/gms/internal/zzey;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzey;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzey$1;->zzzH:Lcom/google/android/gms/internal/zzey;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzey$1;->zzzF:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzey$1;->zzzG:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 7
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/zzey$1;->zzzH:Lcom/google/android/gms/internal/zzey;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzey;->zza(Lcom/google/android/gms/internal/zzey;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    :try_start_e
    iget-object v1, p0, Lcom/google/android/gms/internal/zzey$1;->zzzH:Lcom/google/android/gms/internal/zzey;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzey$1;->zzzF:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzey$1;->zzzG:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzey;->zzg(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J
    :try_end_1b
    .catch Ljava/lang/IllegalStateException; {:try_start_e .. :try_end_1b} :catch_1c

    :goto_1b
    return-void

    :catch_1c
    move-exception v0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzey$1;->zzzH:Lcom/google/android/gms/internal/zzey;

    const-string v1, "Could not store picture."

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzey;->zzah(Ljava/lang/String;)V

    goto :goto_1b
.end method
