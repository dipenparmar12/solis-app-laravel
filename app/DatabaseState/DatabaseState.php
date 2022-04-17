<?php

namespace App\DatabaseState;

use Spatie\Permission\PermissionRegistrar;

class DatabaseState
{
    public function __construct()
    {
        // reset cached roles and permissions
        app()[PermissionRegistrar::class]->forgetCachedPermissions();
    }

    /**
     * @return string[]
     */
    static public function permissions(): array
    {

        return [
            'Project Add' => 'project-create',
            'Project View' => 'project-show',
            'Project modify' => 'project-edit',

            'Project Income Visible ' => 'project-income-show',
            'Project Expense Visible ' => 'project-expense-show',
            'Project Estimate Visible ' => 'project-estimate-show',
            'Project Value Visible' => 'project-budget-show',

            'Project Delete' => 'project-delete',
            'Project list-all' => 'project-list-all',
            'Project list-wip' => 'project-list-wip',
            'Project list-finish' => 'project-list-finish',

            // 'Project mark as completed' => 'project-mark-as-finish',
            // 'Project View Finished' => 'project-view-wip-0-project',


            'Estimate Add' => 'estimate-create',
            'Estimate list-all' => 'estimate-list-all',
            // 'Estimate list-self' => 'estimate-list-self',
            // 'Estimate Delete Self' => 'estimate-delete-self',
            // 'Estimate Delete Any Entry' => 'estimate-delete-all',
            // 'Estimate edit' => 'estimate-edit',
            // 'Estimate edit-self' => 'estimate-edit-self',
            // 'Estimate edit-all' => 'estimate-edit-all',


            'PettyCash Add ' => 'fund-create',
            'PettyCash List self' => 'fund-list-self',
            'PettyCash List All ' => 'fund-list-all',
            'PettyCash View only Self' => 'fund-show-self',
            'PettyCash Delete Self' => 'fund-delete-self',
            'PettyCash Delete Any Entry' => 'fund-delete-all', // Not Updated in Solis-interiors.in
            // 'PettyCash View All Entry of' => 'fund-show-all',
            // 'PettyCash Change' => 'fund-edit-self',
            // 'PettyCash Change' => 'fund-edit-all',

            'Expense Add' => 'expense-create',
            'Expense list all' => 'expense-list-all',
            'Expense list self' => 'expense-list-self',
            'Expense Approval' => 'expense-approval',
            // 'Expense edit self' => 'expense-edit-self',
            // 'Expense edit all' => 'expense-edit-all',
            // 'Expense delete self' => 'expense-delete-self',
            // 'Expense View Self' => 'expense-show-self',
            // 'Expense View all' => 'expense-show-all',
            // 'Expense delete all' => 'expense-delete-all',

            'Income Add' => 'income-create',
            'Income list-all' => 'income-list-all',
            // 'income list-self' => 'income-list-self',
            // 'Income Delete Self' => 'income-delete-self',
            // 'Income Delete Any Entry' => 'income-delete-all',
            // 'Income edit-self' => 'income-edit-self',
            // 'Income edit-all' => 'income-edit-all',
            // 'Income edit' => 'income-edit',

            'Vendor Add' => 'dealer-create',
            'Vendor List all ' => 'dealer-list',
            'Vendor Show details' => 'dealer-show',
            'Vendor Edit' => 'dealer-edit',
            'Vendor Delete' => 'dealer-delete',

            'Transaction create' => 'transaction-create',
            'Transaction list' => 'transaction-list',
            'Transaction edit' => 'transaction-edit',
            'Transaction delete' => 'transaction-delete',

            /// IMP
            'Role list' => 'role-list',
            'Role Add' => 'role-create',
            'Role Modify' => 'role-edit',
            'Role Delete' => 'role-delete',

            'Permission list' => 'permission-list',
            'Permission Add' => 'permission-create',
            'Permission Modify' => 'permission-edit',
            // 'Permission Delete' => 'permission-delete',

            'User Add' => 'user-create',
            'User edit all' => 'user-edit-all',
            'User edit self' => 'user-edit-self',
            'User List all ' => 'user-list-all',
            // 'user-delete-self' => 'user-delete-self',
            // 'user-list-self' => 'user-list-self',
            // 'user-delete-all' => 'user-delete-all',

            //            'Dashboard View' => 'dashboard-pivot',
            //            'Dashboard For Project Expenses' => 'dashboard-project-expense',
            //            'Dashboard For All Project Expenses' => 'dashboard-all-project-expense',
            //            'Dashboard For User income-self' => 'dashboard-income-self',
            //            'Dashboard For User income-all' => 'dashboard-income-all',

            // 'Website image upload' => 'website_deprecated-image-upload',
            // 'View Dev-tool Routes' => 'dev-routes',
            // 'Switch Account' => 'switch-account',

            // 'Export vendor expense sheet' => 'export-dealer-expense',
            // 'Export project income sheet' => 'export-project-income',

            'Salary Add' => 'salary-create',
            'Salary list all' => 'salary-list-all',
            'Salary list self' => 'salary-list-self',
            'Salary View Self' => 'salary-show-self',
            'Salary View all' => 'salary-show-all',
            'Salary edit all' => 'salary-edit-all',
            'Salary edit self' => 'salary-edit-self',

            'Payment Add' => 'payment-create',
            //            'Payment list all' => 'payment-list-all',
            //            'Payment list self' => 'payment-list-self',
            //            'Payment View Self' => 'payment-show-self',
            //            'Payment View all' => 'payment-show-all',
            //            'Payment edit all' => 'payment-edit-all',
            //            'Payment edit self' => 'payment-edit-self',

            'Advance Add' => 'advance-create',
            'Advance list all' => 'advance-list-all',
            'Advance list self' => 'advance-list-self',
            // 'Advance View Self' => 'advance-show-self',
            // 'Advance View all' => 'advance-show-all',
            // 'Advance edit all' => 'advance-edit-all',
            // 'Advance edit self' => 'advance-edit-self',
            // 'Advance delete self' => 'advance-delete-self',

            "Debug" => 'debug'
        ];
    }
}
