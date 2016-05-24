.class final Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns;
.super Ljava/lang/Object;
.source "PermissionColumns.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/PermissionColumns$CursorWrapper;
    }
.end annotation


# direct methods
.method static create(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 3
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 27
    const-string v0, "CREATE TABLE IF NOT EXISTS permission_table (perm_id INTEGER PRIMARY KEY AUTOINCREMENT, perm_value TEXT, perm_hash TEXT NOT NULL DEFAULT 0);"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " INSERT OR REPLACE INTO permission_table (perm_value, perm_hash) VALUES ( \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->hires:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;

    .line 32
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->whitelabel:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;

    .line 33
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', \'0\' );"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 34
    return-void
.end method
